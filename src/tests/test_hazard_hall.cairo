mod tests {
    use shard_dungeon::{
        systems::{hazard_hall::{IHazardHallDispatcher, IHazardHallDispatcherTrait},},
        models::{inventory::{Inventory, inventory}, stats::{Stats, stats},}, tests::utils,
    };

    #[test]
    fn test_win() {
        let player = starknet::contract_address_const::<'P1'>();
        starknet::testing::set_account_contract_address(player);

        let test_world = utils::setup_world();

        starknet::testing::set_block_number(2);

        test_world.hazard_hall.fate_strike();

        let (inventory, stats) = get!(test_world.world, player, (Inventory, Stats));
        assert(inventory.gold == 10, 'inventory gold is wrong');
        assert(stats.experience == 5, 'stats experience is wrong');
    }

    #[test]
    fn test_lose() {
        let player = starknet::contract_address_const::<'P1'>();
        starknet::testing::set_account_contract_address(player);

        let test_world = utils::setup_world();

        starknet::testing::set_block_number(1);

        test_world.hazard_hall.fate_strike();

        let (inventory, stats) = get!(test_world.world, player, (Inventory, Stats));
        assert(inventory.gold == 10, 'inventory gold is wrong');
        assert(stats.experience == 5, 'stats experience is wrong');
    }
}
