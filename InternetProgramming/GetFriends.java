// Get the friends users
	private JSONArray getFriends(String userId) throws Exception {

		String selectStatement = "select * from friends where (senderUserId = ? OR receiverUserId = ?) AND isFriends = ?;";

		PreparedStatement prepStmt = con.prepareStatement(selectStatement);
		prepStmt.setString(1, userId);
		prepStmt.setString(2, userId);
		prepStmt.setBoolean(3, true);

		ResultSet rs = prepStmt.executeQuery();
		JSONArray arr = new JSONArray();
		while (rs.next()) {

			User user = new User();
			String senderId = rs.getString("senderUserId");
			String receiverId = rs.getString("receiverUserId");
			JSONObject obj = new JSONObject();
			obj = user.getSingleUserDetails(userId.equals(senderId) ? receiverId : senderId);
			obj.put("friendsId", rs.getString("friendsId"));
			arr.put(obj);
		}

		prepStmt.close();
		return arr;

	}