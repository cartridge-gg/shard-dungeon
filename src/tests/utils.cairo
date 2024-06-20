use starknet::class_hash::Felt252TryIntoClassHash;
use dojo::world::{IWorldDispatcher, IWorldDispatcherTrait};
use dojo::test_utils::spawn_test_world;

use shard_dungeon::{
    systems::{
        metagame::{IMetagameDispatcher, IMetagameDispatcherTrait, metagame},
        hazard_hall::{IHazardHallDispatcher, IHazardHallDispatcherTrait, hazard_hall},
    },
    models::{
        inventory::{Inventory, inventory}, stats::{Stats, stats}, profile::{Profile, profile},
    },
};

/// A test world with all required models and systems.
#[derive(Drop)]
struct TestWorld {
    world: IWorldDispatcher,
    hazard_hall: IHazardHallDispatcher,
    metagame: IMetagameDispatcher,
}

/// Setups a world with all models and systems.
fn setup_world() -> TestWorld {
    let world = spawn_test_world(array![inventory::TEST_CLASS_HASH, stats::TEST_CLASS_HASH]);

    let hh_address = world
        .deploy_contract(
            'hazard_hall', hazard_hall::TEST_CLASS_HASH.try_into().unwrap(), array![].span()
        );

    let metagame_address = world
        .deploy_contract(
            'metagame', metagame::TEST_CLASS_HASH.try_into().unwrap(), array![].span()
        );

    TestWorld {
        world,
        hazard_hall: IHazardHallDispatcher { contract_address: hh_address },
        metagame: IMetagameDispatcher { contract_address: metagame_address },
    }
}
