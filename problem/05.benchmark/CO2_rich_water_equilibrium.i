# CO2-pure water equilibrium at 10 MPa and 100 C
# CO2 fugacity at 100 C and 100 bar is around 65 bae (phi = 0.66)
# log10(65) = 1.81

[UserObjects]
    [definition]
        type = GeochemicalModelDefinition
        database_file = "../../database/moose_geochemdb.json"
        basis_species = "H2O H+ HCO3-"
        equilibrium_gases = "CO2(g)"
    []
[]

[TimeIndependentReactionSolver]
    model_definition = definition
    swap_out_of_basis = "H+"
    swap_into_basis = "CO2(g)"
    charge_balance_species = "HCO3-"
    constraint_species = "H2O              CO2(g)        HCO3-"
    constraint_value = "  1.0              1.81          1E-6"
    constraint_meaning = "kg_solvent_water log10fugacity bulk_composition"
    constraint_unit = "   kg               dimensionless moles"
    temperature = 100
[]

