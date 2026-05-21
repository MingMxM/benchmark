[UserObjects]
  [definition]
    type = GeochemicalModelDefinition 
    database_file = './../../database/moose_geochemdb.json'
    basis_species = 'H2O H+ Na+ K+ Ca++ Mg++ SiO2(aq) Al+++ Cl- SO4-- HCO3-'
    remove_all_extrapolated_secondary_species = true
    equilibrium_minerals = 'Albite Anhydrite Anorthite Calcite Chalcedony Clinochl-7A Illite K-feldspar Kaolinite Quartz Paragonite Phlogopite Zoisite Laumontite'
  []
[]

[TimeIndependentReactionSolver]
  model_definition = definition
  geochemistry_reactor_name = reactor
  charge_balance_species = 'Cl-'
  constraint_species = 'H2O              H+            Na+              K+               Ca++             Mg++             SiO2(aq)         Al+++            Cl-              SO4--            HCO3-'
  constraint_value = '  1.0              3.16E-8       0.12             0.016            0.68E-3          0.0008E-3        3.7E-3           0.004E-3         0.15             0.5E-3           1.4E-3'
  constraint_meaning = 'kg_solvent_water activity      bulk_composition bulk_composition bulk_composition bulk_composition bulk_composition bulk_composition bulk_composition bulk_composition bulk_composition'
  constraint_unit = '   kg               dimensionless moles            moles            moles            moles            moles            moles            moles            moles            moles'
  temperature = 60
  ramp_max_ionic_strength_initial = 0
[]

[Postprocessors]
  [bulk_H+]
    type = PointValue
    point = '0 0 0'
    variable = 'bulk_moles_H+'
  []
[]

[Outputs]
  csv = true
[]