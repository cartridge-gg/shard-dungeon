use starknet::ContractAddress;

#[derive(Drop, Serde)]
#[dojo::model]
pub struct Profile {
    #[key]
    pub player: ContractAddress,
    pub name: ByteArray,
}
