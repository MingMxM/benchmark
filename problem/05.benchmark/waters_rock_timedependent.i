# Serpentinized basalt geochemistry - standalone test
# Pure water at 100C reacting with serpentinized basalt minerals
# Based on Xiong et al. (2017) IJGGC Table 2 & Table 3

[UserObjects]
  [rate_Diopside_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Diopside
    intrinsic_rate_constant = 4.365e-7
    multiply_by_mass = true
    area_quantity = 0.0017
    activation_energy = 96100
    promoting_species_names = 'H+'
    promoting_indices = 0.71
  []
  [rate_Diopside_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Diopside
    intrinsic_rate_constant = 7.762e-12
    multiply_by_mass = true
    area_quantity = 0.0017
    activation_energy = 40600
  []
  [rate_Hedenbergite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Hedenbergite
    intrinsic_rate_constant = 4.365e-7
    multiply_by_mass = true
    area_quantity = 0.0017
    activation_energy = 96100
    promoting_species_names = 'H+'
    promoting_indices = 0.71
  []
  [rate_Hedenbergite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Hedenbergite
    intrinsic_rate_constant = 7.762e-12
    multiply_by_mass = true
    area_quantity = 0.0017
    activation_energy = 40600
  []
  [rate_Albite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Albite
    intrinsic_rate_constant = 1.380e-9
    multiply_by_mass = true
    area_quantity = 0.0225
    activation_energy = 67797
    promoting_species_names = 'H+'
    promoting_indices = 0.50
  []
  [rate_Albite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Albite
    intrinsic_rate_constant = 1.0e-12
    multiply_by_mass = true
    area_quantity = 0.0225
    activation_energy = 66546
  []
  [rate_Anorthite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Anorthite
    intrinsic_rate_constant = 1.380e-9
    multiply_by_mass = true
    area_quantity = 0.0225
    activation_energy = 67797
    promoting_species_names = 'H+'
    promoting_indices = 0.50
  []
  [rate_Anorthite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Anorthite
    intrinsic_rate_constant = 1.0e-12
    multiply_by_mass = true
    area_quantity = 0.0225
    activation_energy = 66546
  []
  [rate_Forsterite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Forsterite
    intrinsic_rate_constant = 1.413e-7
    multiply_by_mass = true
    area_quantity = 0.009
    activation_energy = 67197
    promoting_species_names = 'H+'
    promoting_indices = 0.47
  []
  [rate_Forsterite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Forsterite
    intrinsic_rate_constant = 2.291e-11
    multiply_by_mass = true
    area_quantity = 0.009
    activation_energy = 78994
  []
  [rate_Fayalite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Fayalite
    intrinsic_rate_constant = 1.413e-7
    multiply_by_mass = true
    area_quantity = 0.0018
    activation_energy = 94394
    promoting_species_names = 'H+'
    promoting_indices = 0.47
  []
  [rate_Fayalite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Fayalite
    intrinsic_rate_constant = 1.585e-13
    multiply_by_mass = true
    area_quantity = 0.0018
    activation_energy = 94394
  []
  [rate_Kfeldspar_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = K-feldspar
    intrinsic_rate_constant = 3.548e-10
    multiply_by_mass = true
    area_quantity = 0.019
    activation_energy = 51930
    promoting_species_names = 'H+'
    promoting_indices = 0.50
  []
  [rate_Kfeldspar_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = K-feldspar
    intrinsic_rate_constant = 3.981e-13
    multiply_by_mass = true
    area_quantity = 0.019
    activation_energy = 37991
  []
  [rate_Antigorite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Antigorite
    intrinsic_rate_constant = 9.772e-11
    multiply_by_mass = true
    area_quantity = 0.18
    activation_energy = 70023
    promoting_species_names = 'H+'
    promoting_indices = 0.45
  []
  [rate_Antigorite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Antigorite
    intrinsic_rate_constant = 8.318e-13
    multiply_by_mass = true
    area_quantity = 0.18
    activation_energy = 56600
  []
  [rate_Greenalite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Greenalite
    intrinsic_rate_constant = 9.772e-11
    multiply_by_mass = true
    area_quantity = 0.18
    activation_energy = 70023
    promoting_species_names = 'H+'
    promoting_indices = 0.45
  []
  [rate_Greenalite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Greenalite
    intrinsic_rate_constant = 8.318e-13
    multiply_by_mass = true
    area_quantity = 0.18
    activation_energy = 56600
  []
  [rate_Calcite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Calcite
    intrinsic_rate_constant = 0.5012
    multiply_by_mass = true
    area_quantity = 0.037
    activation_energy = 14394
    promoting_species_names = 'H+'
    promoting_indices = 1.0
  []
  [rate_Calcite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Calcite
    intrinsic_rate_constant = 1.549e-6
    multiply_by_mass = true
    area_quantity = 0.037
    activation_energy = 23524
  []
  [rate_Magnesite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Magnesite
    intrinsic_rate_constant = 4.169e-7
    multiply_by_mass = true
    area_quantity = 0.0662
    activation_energy = 14394
    promoting_species_names = 'H+'
    promoting_indices = 1.0
  []
  [rate_Magnesite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Magnesite
    intrinsic_rate_constant = 4.571e-10
    multiply_by_mass = true
    area_quantity = 0.0662
    activation_energy = 23524
  []
  [rate_Siderite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Siderite
    intrinsic_rate_constant = 1.820e-4
    multiply_by_mass = true
    area_quantity = 0.105
    activation_energy = 55994
    promoting_species_names = 'H+'
    promoting_indices = 0.90
  []
  [rate_Siderite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Siderite
    intrinsic_rate_constant = 1.259e-9
    multiply_by_mass = true
    area_quantity = 0.105
    activation_energy = 62760
  []
  [rate_Gibbsite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Gibbsite
    intrinsic_rate_constant = 2.239e-8
    multiply_by_mass = true
    area_quantity = 19.0
    activation_energy = 47509
    promoting_species_names = 'H+'
    promoting_indices = 0.992
  []
  [rate_Gibbsite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Gibbsite
    intrinsic_rate_constant = 3.162e-12
    multiply_by_mass = true
    area_quantity = 19.0
    activation_energy = 61213
  []

  [definition]
    type = GeochemicalModelDefinition
    database_file = "../../database/moose_geochemdb.json"
    basis_species = "H2O H+ HCO3- Ca++ Mg++ Fe++ SiO2(aq) Al+++ Na+ K+"
    kinetic_minerals = "Diopside Hedenbergite Albite Anorthite Forsterite Fayalite
                        K-feldspar Antigorite Greenalite Calcite Magnesite Siderite Gibbsite"
    kinetic_rate_descriptions = "rate_Diopside_acid     rate_Diopside_neutral
                                  rate_Hedenbergite_acid  rate_Hedenbergite_neutral
                                  rate_Albite_acid        rate_Albite_neutral
                                  rate_Anorthite_acid     rate_Anorthite_neutral
                                  rate_Forsterite_acid    rate_Forsterite_neutral
                                  rate_Fayalite_acid      rate_Fayalite_neutral
                                  rate_Kfeldspar_acid     rate_Kfeldspar_neutral
                                  rate_Antigorite_acid    rate_Antigorite_neutral
                                  rate_Greenalite_acid    rate_Greenalite_neutral
                                  rate_Calcite_acid       rate_Calcite_neutral
                                  rate_Magnesite_acid     rate_Magnesite_neutral
                                  rate_Siderite_acid      rate_Siderite_neutral
                                  rate_Gibbsite_acid      rate_Gibbsite_neutral"
  []
[]

[TimeDependentReactionSolver]
  model_definition = definition
  geochemistry_reactor_name = reactor
  charge_balance_species = "HCO3-"
  constraint_species = "H2O   H+     HCO3-  Ca++   Mg++   Fe++   SiO2(aq) Al+++ Na+    K+"
  constraint_value   = "1.0   -7.0   1e-10  1e-10  1e-10  1e-10  1e-10    1e-10 1e-10  1e-10"
  constraint_meaning = "kg_solvent_water log10activity bulk_composition bulk_composition
                        bulk_composition bulk_composition bulk_composition
                        bulk_composition bulk_composition bulk_composition"
  constraint_unit    = "kg dimensionless moles moles moles moles moles moles moles moles"
  kinetic_species_name          = "Diopside  Hedenbergite Albite   Anorthite  Forsterite
                                   Fayalite  K-feldspar   Antigorite Greenalite
                                   Calcite   Magnesite    Siderite   Gibbsite"
  kinetic_species_initial_value = "58.63   37.14   43.54   67.02   32.85
                                   28.07   107.84  11.60   13.39
                                   1e-10   1e-10   1e-10   1e-10"
  kinetic_species_unit          = "g g g g g g g g g g g g g"
  temperature = 100
  evaluate_kinetic_rates_always = true
  execute_console_output_on = ''
[]

[GlobalParams]
  point = '0 0 0'
  reactor = reactor
[]

[Executioner]
  type = Transient
  dt = 86400          # 1 day
  end_time = 8640000  # 100 days
[]

[AuxVariables]
  [m_Ca]    []
  [m_Mg]    []
  [m_Fe]    []
  [m_SiO2]  []
  [m_Al]    []
  [m_Na]    []
  [m_K]     []
  [m_HCO3]  []
[]

[AuxKernels]
  [m_Ca_auxk]
    type = GeochemistryQuantityAux
    variable = m_Ca
    species = 'Ca++'
    quantity = molal
    execute_on = 'timestep_end'
  []
  [m_Mg_auxk]
    type = GeochemistryQuantityAux
    variable = m_Mg
    species = 'Mg++'
    quantity = molal
    execute_on = 'timestep_end'
  []
  [m_Fe_auxk]
    type = GeochemistryQuantityAux
    variable = m_Fe
    species = 'Fe++'
    quantity = molal
    execute_on = 'timestep_end'
  []
  [m_SiO2_auxk]
    type = GeochemistryQuantityAux
    variable = m_SiO2
    species = 'SiO2(aq)'
    quantity = molal
    execute_on = 'timestep_end'
  []
  [m_Al_auxk]
    type = GeochemistryQuantityAux
    variable = m_Al
    species = 'Al+++'
    quantity = molal
    execute_on = 'timestep_end'
  []
  [m_Na_auxk]
    type = GeochemistryQuantityAux
    variable = m_Na
    species = 'Na+'
    quantity = molal
    execute_on = 'timestep_end'
  []
  [m_K_auxk]
    type = GeochemistryQuantityAux
    variable = m_K
    species = 'K+'
    quantity = molal
    execute_on = 'timestep_end'
  []
  [m_HCO3_auxk]
    type = GeochemistryQuantityAux
    variable = m_HCO3
    species = 'HCO3-'
    quantity = molal
    execute_on = 'timestep_end'
  []
[]

[Postprocessors]
  [pH]
    type = PointValue
    variable = pH
  []
  [molal_Ca]
    type = PointValue
    variable = m_Ca
  []
  [molal_Mg]
    type = PointValue
    variable = m_Mg
  []
  [molal_Fe]
    type = PointValue
    variable = m_Fe
  []
  [molal_SiO2]
    type = PointValue
    variable = m_SiO2
  []
  [molal_Al]
    type = PointValue
    variable = m_Al
  []
  [molal_Na]
    type = PointValue
    variable = m_Na
  []
  [molal_K]
    type = PointValue
    variable = m_K
  []
  [molal_HCO3]
    type = PointValue
    variable = m_HCO3
  []
  [diopside_g]
    type = PointValue
    variable = free_mg_Diopside
  []
  [hedenbergite_g]
    type = PointValue
    variable = free_mg_Hedenbergite
  []
  [albite_g]
    type = PointValue
    variable = free_mg_Albite
  []
  [anorthite_g]
    type = PointValue
    variable = free_mg_Anorthite
  []
  [forsterite_g]
    type = PointValue
    variable = free_mg_Forsterite
  []
  [fayalite_g]
    type = PointValue
    variable = free_mg_Fayalite
  []
  [kfeldspar_g]
    type = PointValue
    variable = free_mg_K-feldspar
  []
  [antigorite_g]
    type = PointValue
    variable = free_mg_Antigorite
  []
  [greenalite_g]
    type = PointValue
    variable = free_mg_Greenalite
  []
  [calcite_g]
    type = PointValue
    variable = free_mg_Calcite
  []
  [magnesite_g]
    type = PointValue
    variable = free_mg_Magnesite
  []
  [siderite_g]
    type = PointValue
    variable = free_mg_Siderite
  []
  [gibbsite_g]
    type = PointValue
    variable = free_mg_Gibbsite
  []
[]

[Outputs]
  csv = true
[]