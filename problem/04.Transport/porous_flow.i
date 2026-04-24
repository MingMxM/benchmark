[Mesh]
  [gen]
    type = GeneratedMeshGenerator
    dim = 2
    nx = 14
    ny = 8
    xmin = -70
    xmax = 70
    ymin = -40
    ymax = 40
  []
  [injection_node]
    input = gen
    type = ExtraNodesetGenerator
    new_boundary = injection_node
    coord = '-30 0 0'
  []
[]

[GlobalParams]
  PorousFlowDictator = dictator
  gravity = '0 0 0'
[]

[Variables]
  [f0]
    initial_condition = 0.002285946
  []
  [f1]
    initial_condition = 0.0035252
  []
  [f2]
    initial_condition = 1.3741E-05
  []
  [porepressure]
    initial_condition = 2E6
  []
  [temperature]
    initial_condition = 50
    scaling = 1E-6
  []
[]

[BCs]
  [injection_temperature]
    type = MatchedValueBC
    variable = temperature
    v = injection_temperature
    boundary = injection_node
  []
[]

[DiracKernels]
  [inject_Na]
    type = PorousFlowPolyLineSink
    SumQuantityUO = injected_mass
    fluxes = ${injection_rate}
    p_or_t_vals = 0.0
    line_length = 1.0
    multiplying_var = injection_rate_massfrac_Na
    point_file = injection.bh
    variable = f0
  []
    
[]