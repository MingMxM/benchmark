//* This file is part of the MOOSE framework
//* https://mooseframework.inl.gov
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html
#include "BenchmarkTestApp.h"
#include "BenchmarkApp.h"
#include "Moose.h"
#include "AppFactory.h"
#include "MooseSyntax.h"

InputParameters
BenchmarkTestApp::validParams()
{
  InputParameters params = BenchmarkApp::validParams();
  params.set<bool>("use_legacy_material_output") = false;
  params.set<bool>("use_legacy_initial_residual_evaluation_behavior") = false;
  return params;
}

BenchmarkTestApp::BenchmarkTestApp(const InputParameters & parameters) : MooseApp(parameters)
{
  BenchmarkTestApp::registerAll(
      _factory, _action_factory, _syntax, getParam<bool>("allow_test_objects"));
}

BenchmarkTestApp::~BenchmarkTestApp() {}

void
BenchmarkTestApp::registerAll(Factory & f, ActionFactory & af, Syntax & s, bool use_test_objs)
{
  BenchmarkApp::registerAll(f, af, s);
  if (use_test_objs)
  {
    Registry::registerObjectsTo(f, {"BenchmarkTestApp"});
    Registry::registerActionsTo(af, {"BenchmarkTestApp"});
  }
}

void
BenchmarkTestApp::registerApps()
{
  registerApp(BenchmarkApp);
  registerApp(BenchmarkTestApp);
}

/***************************************************************************************************
 *********************** Dynamic Library Entry Points - DO NOT MODIFY ******************************
 **************************************************************************************************/
// External entry point for dynamic application loading
extern "C" void
BenchmarkTestApp__registerAll(Factory & f, ActionFactory & af, Syntax & s)
{
  BenchmarkTestApp::registerAll(f, af, s);
}
extern "C" void
BenchmarkTestApp__registerApps()
{
  BenchmarkTestApp::registerApps();
}
