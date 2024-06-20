use starknet::ContractAddress;

#[derive(Drop, Serde)]
#[dojo::model]
pub struct Inventory {
    #[key]
    pub player: ContractAddress,
    pub gold: u64,
}
