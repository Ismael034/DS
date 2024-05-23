require "test_helper"

module ApplicationCable
  class ConnectionTest < ActionCable::Connection::TestCase
    test "establece correctamente las identificaciones de usuario" do
      user = users(:one) 
      connect "/cable", headers: { "X-USER-ID": user.id }
      assert_equal connection.current_user, user
    end

    test "rechaza conexiones no autorizadas" do
      assert_reject_connection { connect "/cable" }
    end
  end
end
