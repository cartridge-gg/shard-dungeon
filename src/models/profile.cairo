use starknet::ContractAddress;

#[derive(Drop, Serde)]
#[dojo::model]
struct Profile {
    #[key]
    player: ContractAddress,
    name: ByteArray,
}
