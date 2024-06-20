use starknet::ContractAddress;

#[derive(Copy, Drop, Serde)]
#[dojo::model]
struct Stats {
    #[key]
    player: ContractAddress,
    experience: u64,
}
