# 1.0 # 查询透辉石（Diopside）在水中的溶解反应

# [GeochemicalModelInterrogator]
#   model_definition = definition
#   equilibrium_species = Diopside
#   temperature = 25
# []

# [UserObjects]
#   [definition]
#     type = GeochemicalModelDefinition
#     database_file = "../../../database/moose_geochemdb.json"
#     basis_species = "H2O Ca++ Mg++ SiO2(aq) H+"
#     equilibrium_minerals = "Diopside"
#     piecewise_linear_interpolation = true
#   []
# []


# 2.0 # 查询透辉石在富 CO2 水中的溶解反应

# [GeochemicalModelInterrogator]
#   model_definition = definition
#   equilibrium_species = Diopside
#   swap_out_of_basis = "H+"
#   swap_into_basis = "CO2(aq)"
#   temperature = 25
# []

# [UserObjects]
#   [definition]
#     type = GeochemicalModelDefinition
#     database_file = "../../../database/moose_geochemdb.json"
#     basis_species = "H2O Ca++ Mg++ SiO2(aq) H+ HCO3-"
#     equilibrium_minerals = "Diopside"
#     piecewise_linear_interpolation = true
#   []
# []

# 3.0 查询透辉石溶解 + 碳酸盐矿物形成的反应

[GeochemicalModelInterrogator]
  model_definition = definition
#   equilibrium_species = Calcite     # 先查方解石
  swap_out_of_basis = "H+"
  swap_into_basis = "CO2(aq)"
[]

[UserObjects]
  [definition]
    type = GeochemicalModelDefinition
    database_file = "../../../database/moose_geochemdb.json"
    basis_species = "H2O Ca++ Mg++ SiO2(aq) H+ HCO3-"
    equilibrium_minerals = "Diopside Calcite Magnesite Dolomite"
    piecewise_linear_interpolation = true
  []
[]