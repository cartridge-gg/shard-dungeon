use starknet::ContractAddress;

#[derive(Drop, Serde)]
#[dojo::model]
pub struct Stats {
    #[key]
    pub player: ContractAddress,
    pub experience: u64,
}
