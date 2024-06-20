/// The metagame aims at being played on Starknet.
/// 
/// The metagame is where players can register, and start a dungeon.
///
use shard_dungeon::models::profile::Profile;

#[dojo::interface]
trait IMetagame {
    /// Registers a player to the metagame. Once registered, the player can participate
    /// to a dungeon.
    fn register_player(ref world: IWorldDispatcher, name: ByteArray);
// Here we need to define how the dungeon has to be started with which players.
}

#[dojo::contract]
mod metagame {
    use super::IMetagame;

    use shard_dungeon::models::profile::Profile;
    use shard_dungeon::models::inventory::Inventory;
    use shard_dungeon::common::utils;

    #[abi(embed_v0)]
    impl MetagameImpl of IMetagame<ContractState> {
        fn register_player(ref world: IWorldDispatcher, name: ByteArray) {
            let player = utils::get_player_address();

            let mut profile = get!(world, player, (Profile));
            profile.name = name;

            let inventory = Inventory { player, gold: 100, };

            set!(world, (profile, inventory));
        }
    }
}
