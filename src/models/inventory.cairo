use starknet::ContractAddress;

#[derive(Copy, Drop, Serde)]
#[dojo::model]
struct Inventory {
    #[key]
    player: ContractAddress,
    gold: u64,
}
