// Get all Receive friends
	private JSONArray receiverRequest(String userId) throws Exception {

		String selectStatement = "select * from friends where receiverUserId = ? AND isFriends = ?;";

		PreparedStatement prepStmt = con.prepareStatement(selectStatement);
		prepStmt.setString(1, userId);
		prepStmt.setBoolean(2, false);

		ResultSet rs = prepStmt.executeQuery();

		JSONArray arr = new JSONArray();
		while (rs.next()) {
			User user = new User();

			JSONObject obj = new JSONObject();
			obj = user.getSingleUserDetails(rs.getString("senderUserId"));
			obj.put("friendsId", rs.getString("friendsId"));
			arr.put(obj);

		}

		prepStmt.close();

		return arr;
	}
