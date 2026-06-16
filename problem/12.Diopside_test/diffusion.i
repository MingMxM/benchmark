# groundwater velocity is 10m.yr^-1 divided by porosity of 0.3
# The following are the mole numbers of the species in the groundwater
# The numerical values can be obtained by running the geochemistry simulation with a very small timestep so no kinetics are active (use the transported_bulk_moles values)
eqm_H2O = 5.550189e+01
eqm_HCO3 = 2.220543e-03
eqm_Ca = 1.664178e-04
eqm_Mg = 1.449945e-04
eqm_SiO2 = 2.899622e-04
eqm_H = 1.597719e-03
# The following are scalings used in calculating the residual.  Eg, because the concentration of CH3COO is so low, its residual is always tiny, so to get better accuracy it should be scaled
# scale_H2O = ${fparse 1.0 / eqm_H2O}
# scale_HCO3 = ${fparse 1.0 / eqm_HCO3}
# scale_Ca = ${fparse 1.0 / eqm_Ca}
# scale_Mg = ${fparse 1.0 / eqm_Mg}
# scale_SiO2 = ${fparse 1.0 / eqm_SiO2}
# scale_H = ${fparse 1.0 / eqm_H}
[Mesh]
  [gen]
    type = GeneratedMeshGenerator
    dim = 1
    nx = 80
    xmin = 0
    xmax = 0.04
    # ny = 24
    # ymin = 0
    # ymax = 0.012
  []
[]

[UserObjects]
  [nodal_void_volume_uo]
    type = NodalVoidVolume
    porosity = 1.0
    execute_on = 'initial'
  []
[]

[Variables]
  [conc_H2O]
    initial_condition = ${eqm_H2O}
    # scaling = ${scale_H2O}
  []
  [conc_HCO3]
    initial_condition = ${eqm_HCO3}
    # scaling = ${scale_HCO3}
  []
  [conc_Ca]
    initial_condition = ${eqm_Ca}
    # scaling = ${scale_Ca}
  []
  [conc_Mg]
    initial_condition = ${eqm_Mg}
    # scaling = ${scale_Mg}
  []
  [conc_SiO2]
    initial_condition = ${eqm_SiO2}
    # scaling = ${scale_SiO2}
  []
  [conc_H]
    initial_condition = ${eqm_H}
    # scaling = ${scale_H}
  []
[]

[Kernels]
  [dot_H2O]
    type = GeochemistryTimeDerivative
    variable = conc_H2O
    save_in = rate_H2O
  []
  [dot_HCO3]
    type = GeochemistryTimeDerivative
    variable = conc_HCO3
    save_in = rate_HCO3
  []
  [dot_Ca]
    type = GeochemistryTimeDerivative
    variable = conc_Ca
    save_in = rate_Ca
  []
  [dot_Mg]
    type = GeochemistryTimeDerivative
    variable = conc_Mg
    save_in = rate_Mg
  []
  [dot_SiO2]
    type = GeochemistryTimeDerivative
    variable = conc_SiO2
    save_in = rate_SiO2
  []
  [dot_H]
    type = GeochemistryTimeDerivative
    variable = conc_H
    save_in = rate_H
  []

  # [adv_H2O]
  #   type = ConservativeAdvection
  #   variable = conc_H2O
  #   velocity = velocity
  #   upwinding_type = FULL
  # []
  # [adv_HCO3]
  #   type = ConservativeAdvection
  #   variable = conc_HCO3
  #   velocity = velocity
  #   upwinding_type = FULL
  # []
  # [adv_Ca]
  #   type = ConservativeAdvection
  #   variable = conc_Ca
  #   velocity = velocity
  #   upwinding_type = FULL
  # []
  # [adv_Mg]
  #   type = ConservativeAdvection
  #   variable = conc_Mg
  #   velocity = velocity
  #   upwinding_type = FULL
  # []
  # [adv_SiO2]
  #   type = ConservativeAdvection
  #   variable = conc_SiO2
  #   velocity = velocity
  #   upwinding_type = FULL
  # []
  # [adv_H]
  #   type = ConservativeAdvection
  #   variable = conc_H
  #   velocity = velocity
  #   upwinding_type = FULL
  # []    

  [diff_H2O]
    type = GeochemistryDispersion
    tensor_coeff = '7.5e-9 0      0
                    0      7.5e-9 0
                    0      0      7.5e-9'
    variable = conc_H2O
  []
  [diff_HCO3]
    type = GeochemistryDispersion
    tensor_coeff = '7.5e-9 0      0
                    0      7.5e-9 0
                    0      0      7.5e-9'
    variable = conc_HCO3
  []
  [diff_Ca]
    type = GeochemistryDispersion
    tensor_coeff = '7.5e-9 0      0
                    0      7.5e-9 0
                    0      0      7.5e-9'
    variable = conc_Ca
  []
  [diff_Mg]
    type = GeochemistryDispersion
    tensor_coeff = '7.5e-9 0      0
                    0      7.5e-9 0
                    0      0      7.5e-9'
    variable = conc_Mg
  []
  [diff_SiO2]
    type = GeochemistryDispersion
    tensor_coeff = '7.5e-9 0      0
                    0      7.5e-9 0
                    0      0      7.5e-9'
    variable = conc_SiO2
  []
  [diff_H]
    type = GeochemistryDispersion
    tensor_coeff = '7.5e-9 0      0
                    0      7.5e-9 0
                    0      0      7.5e-9'
    variable = conc_H
  []
[]

[AuxVariables]
  [velocity]
    family = MONOMIAL_VEC
    order = CONSTANT
  []
  [nodal_void_volume]
  []
  [rate_H2O]
  []
  [rate_HCO3]
  []
  [rate_Ca]
  []
  [rate_Mg]
  []
  [rate_SiO2]
  []
  [rate_H]
  []
[]

[AuxKernels]
  [velocity]
    type = VectorFunctionAux
    function = vel_fcn
    variable = velocity
  []
    
  [nodal_void_volume_auxk]
    type = NodalVoidVolumeAux
    variable = nodal_void_volume
    nodal_void_volume_uo = nodal_void_volume_uo
    execute_on = 'initial timestep_end' # "initial" to ensure it is properly evaluated for the first timestep
  []
[]

[Functions]
  # The residence time is 24h = 86400s; velocity = 0.04 m / 86400 s = 4.62963 e-7 
  [vel_fcn]
    type = ParsedVectorFunction
    expression_x = 4.62963e-7
    expression_y = 0
    expression_z = 0
  []
[]

[BCs]
  [inject_H2O]
    type = DirichletBC
    boundary = 'left'
    variable = conc_H2O
    value = 54.63
  []
  [inject_HCO3]
    type = DirichletBC
    boundary = 'left'
    variable = conc_HCO3
    value = 0.8679
  []
  [inject_Ca]
    type = DirichletBC
    boundary = 'left'
    variable = conc_Ca
    value = 0
  []
  [inject_Mg]
    type = DirichletBC
    boundary = 'left'
    variable = conc_Mg
    value = 0
  []
  [inject_SiO2]
    type = DirichletBC
    boundary = 'left'
    variable = conc_SiO2
    value = 0
  []
  [inject_H]
    type = DirichletBC
    boundary = 'left'
    variable = conc_H
    value = 0.8679
  []
[]

[Preconditioning]
  [typically_efficient]
    type = SMP
    full = true
    petsc_options_iname = '-pc_type -pc_hypre_type'
    petsc_options_value = ' hypre    boomeramg'
  []
[]

[Executioner]
  type = Transient
  solve_type = NEWTON

  # [TimeStepper]
  #   type = FunctionDT
  #   function = 'max(100, 0.1 * t)'
  # []
  # end_time = 2.4192e7    # 40 weeks in seconds

  dt = 200
  end_time = 864000

[]

[Outputs]
  exodus = true
[]

[MultiApps]
  [react]
    type = TransientMultiApp
    input_files = water_geochemistry_test.i
    clone_parent_mesh = true
    execute_on = 'timestep_end' # This is critical
  []
[]

[Transfers]
  [changes_due_to_flow]
    type = MultiAppCopyTransfer
    to_multi_app = react
    source_variable = 'rate_H2O rate_HCO3 rate_Ca rate_Mg rate_SiO2 rate_H' # change in mole number at every node / dt
    variable = 'pf_rate_H2O pf_rate_HCO3 pf_rate_Ca pf_rate_Mg pf_rate_SiO2 pf_rate_H' # change in moles at every node / dt
  []
  [transported_moles_from_geochem]
    type = MultiAppCopyTransfer
    from_multi_app = react
    source_variable = 'transported_H2O transported_HCO3 transported_Ca transported_Mg transported_SiO2 transported_H'
    variable = 'conc_H2O conc_HCO3 conc_Ca conc_Mg conc_SiO2 conc_H'
  []
[]
