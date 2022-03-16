public Pair<Integer, String> searchFriends(String keyword, String userId) {

		try {
			String sqlStatement = """
					select userId, name, email
					from user
					WHERE (
						userId in (
							select receiverUserId
							from friends
							where (senderUserId = ? AND isFriends = true)
						)
						OR
						(
						userId in (
							select senderUserId
							from friends
							where receiverUserId = ? AND isFriends = true)
						)
					)
					AND
					(
						name LIKE ? OR email LIKE ?
					)
					AND userId != ?
					""";

			PreparedStatement prepStmt = con.prepareStatement(sqlStatement);

			prepStmt.setString(1, userId);
			prepStmt.setString(2, userId);
			prepStmt.setString(3, '%' + keyword + '%');
			prepStmt.setString(4, '%' + keyword + '%');
			prepStmt.setString(5, userId);

			ResultSet rs = prepStmt.executeQuery();

			System.out.println("statement" + rs);

			JSONArray friendsArray = new JSONArray();

			while (rs.next()) {
				JSONObject user = new JSONObject();
				user.put("userId", rs.getString("userId"));
				user.put("name", rs.getString("name"));
				user.put("email", rs.getString("email"));
				friendsArray.put(user);
			}
			JSONObject obj = new JSONObject();
			obj.put("friends", friendsArray);
			remove();
			return new Pair<Integer, String>(200,
					ApiResponseHandler.apiResponse(ResponseType.SUCCESS, SearchConstraints.success, obj));
		} catch (Exception e) {
			remove();
			System.out.println("Error Error " + e);
			return new Pair<Integer, String>(400, ApiResponseHandler.apiResponse(ResponseType.SERVERERROR));
		}
	}