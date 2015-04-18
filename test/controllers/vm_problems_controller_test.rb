require 'test_helper'

class VmProblemsControllerTest < ActionController::TestCase
  setup do
    @vm_problem = vm_problems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vm_problems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vm_problem" do
    assert_difference('VmProblem.count') do
      post :create, vm_problem: { resolved: @vm_problem.resolved, what_is_the_problem: @vm_problem.what_is_the_problem, who_are_you: @vm_problem.who_are_you }
    end

    assert_redirected_to vm_problem_path(assigns(:vm_problem))
  end

  test "should show vm_problem" do
    get :show, id: @vm_problem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vm_problem
    assert_response :success
  end

  test "should update vm_problem" do
    patch :update, id: @vm_problem, vm_problem: { resolved: @vm_problem.resolved, what_is_the_problem: @vm_problem.what_is_the_problem, who_are_you: @vm_problem.who_are_you }
    assert_redirected_to vm_problem_path(assigns(:vm_problem))
  end

  test "should destroy vm_problem" do
    assert_difference('VmProblem.count', -1) do
      delete :destroy, id: @vm_problem
    end

    assert_redirected_to vm_problems_path
  end
end
