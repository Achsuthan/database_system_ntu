// Get sent request fiends
	private JSONArray sentRequest(String userId) throws Exception {

		String selectStatement = "select * from friends where senderUserId = ? AND isFriends = ?;";

		PreparedStatement prepStmt = con.prepareStatement(selectStatement);
		prepStmt.setString(1, userId);
		prepStmt.setBoolean(2, false);

		ResultSet rs = prepStmt.executeQuery();

		JSONArray arr = new JSONArray();
		while (rs.next()) {

			User user = new User();
			JSONObject obj = new JSONObject();
			obj = user.getSingleUserDetails(rs.getString("receiverUserId"));
			obj.put("friendsId", rs.getString("friendsId"));
			arr.put(obj);
		}

		prepStmt.close();
		return arr;
	}
