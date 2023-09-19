require "test_helper"

class HealersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @healer = healers(:one)
  end

  test "should get index" do
    get healers_url
    assert_response :success
  end

  test "should get new" do
    get new_healer_url
    assert_response :success
  end

  test "should create healer" do
    assert_difference("Healer.count") do
      post healers_url, params: { healer: { contact: @healer.contact, description: @healer.description, name: @healer.name, service: @healer.service } }
    end

    assert_redirected_to healer_url(Healer.last)
  end

  test "should show healer" do
    get healer_url(@healer)
    assert_response :success
  end

  test "should get edit" do
    get edit_healer_url(@healer)
    assert_response :success
  end

  test "should update healer" do
    patch healer_url(@healer), params: { healer: { contact: @healer.contact, description: @healer.description, name: @healer.name, service: @healer.service } }
    assert_redirected_to healer_url(@healer)
  end

  test "should destroy healer" do
    assert_difference("Healer.count", -1) do
      delete healer_url(@healer)
    end

    assert_redirected_to healers_url
  end
end
