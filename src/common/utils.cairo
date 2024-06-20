use starknet::ContractAddress;

/// Get the address of the player, this is the address of the account originating the transaction.
///
/// # Returns
/// The address of the player.
#[inline(always)]
pub fn get_player_address() -> ContractAddress {
    starknet::get_tx_info().unbox().account_contract_address
}
