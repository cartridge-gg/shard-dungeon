mod tests {
    use shard_dungeon::{
        systems::{metagame::{IMetagameDispatcher, IMetagameDispatcherTrait},},
        models::{profile::{Profile, profile},}, tests::utils,
    };

    #[test]
    fn test_metagame() {
        let player = starknet::contract_address_const::<'P1'>();
        starknet::testing::set_account_contract_address(player);

        let test_world = utils::setup_world();

        test_world.metagame.register_player("Player 1");

        let profile = get!(test_world.world, player, Profile);
        assert(profile.name == "Player 1", 'profile name is wrong');
    }
}
