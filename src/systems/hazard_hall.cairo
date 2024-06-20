/// The hazard hall is a place where players can strike the boss, and based
/// on some execution info, the players can win or lose.
///
/// NOTE:
/// Currently, this contract is being deployed by Sozo during `sozo migrate apply`.
/// We may skip this contract deployment and let the shard doing so. We only need it
/// to be declared.

#[dojo::interface]
trait IHazardHall {
    /// Strikes the hall boss.
    fn fate_strike(ref world: IWorldDispatcher);
}

#[dojo::contract]
mod hazard_hall {
    use super::IHazardHall;

    use starknet::ContractAddress;

    use shard_dungeon::models::inventory::Inventory;
    use shard_dungeon::models::stats::Stats;
    use shard_dungeon::common::utils;

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        EndOfDungeon: EndOfDungeon,
    }

    // TODO: we may not need data inside this event, as it may only notify
    // the shard operator that the dungeon is over.
    #[derive(Drop, Serde, starknet::Event)]
    struct EndOfDungeon {
        player: ContractAddress,
        has_won: bool,
    }

    #[abi(embed_v0)]
    impl HazardHallImpl of IHazardHall<ContractState> {
        fn fate_strike(ref world: IWorldDispatcher) {
            let player = utils::get_player_address();
            let block_timestamp = starknet::get_block_info().unbox().block_timestamp;

            let has_won = block_timestamp % 2 == 0;

            let (mut inventory, mut stats) = get!(world, player, (Inventory, Stats));

            if has_won {
                inventory.gold += 10;
                stats.experience += 5;
            } else {
                inventory.gold -= 1;
            }

            set!(world, (inventory, stats));
            emit!(world, (Event::EndOfDungeon(EndOfDungeon { player, has_won })));
        }
    }
}
