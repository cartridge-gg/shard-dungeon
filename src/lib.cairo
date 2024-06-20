mod systems {
    pub mod metagame;
    pub mod hazard_hall;
}

mod models {
    pub mod inventory;
    pub mod profile;
    pub mod stats;
}

mod common {
    pub mod utils;
}

#[cfg(test)]
mod tests {
    mod utils;
    mod test_metagame;
    mod test_hazard_hall;
}
