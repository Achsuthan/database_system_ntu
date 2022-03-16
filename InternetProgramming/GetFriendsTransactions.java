public Pair<Integer, String> getAllSharedTransactions(String userId) throws Exception {
		
		try {
			User user = new User();
			if (user.CheckUserExist(userId)) {
				
				String selectStatement = """
							select transaction.transactionId as transactionId, transaction.name as transactionName, transaction.description,
							 transaction.amount, transaction.date, transaction.categoryId, transaction.userId as senderId, transaction.transactionTo,
							  transaction.transactionType, shared_transaction.persentage, shared_transaction.receiverUserId as userId,
							   shared_transaction.sennderUserId as senderUserId, user.email, user.name as userName, category.categoryName,
							    category.imageName, category.color from transaction inner join 
							    shared_transaction on (shared_transaction.transactionId = transaction.transactionId AND (shared_transaction.sennderUserId=? || shared_transaction.receiverUserId=?) 
							    AND transaction.transactionTo='friend') inner join category on(category.categoryId = transaction.categoryId) 
							    inner join user on(user.userId = if (shared_transaction.receiverUserId = ?, shared_transaction.sennderUserId, shared_transaction.receiverUserId)) 
							    order by transaction.createdDate desc;
						""";

				PreparedStatement prepStmt = con.prepareStatement(selectStatement);
				prepStmt.setNString(1, userId);
				prepStmt.setNString(2, userId);
				prepStmt.setNString(3, userId);

				ResultSet rs = prepStmt.executeQuery();
				
				Double youSpent = 0.0;
				Double youReceived = 0.0; 
				
				models.SharedTransaction sharedTransaction = new models.SharedTransaction();
				
				while (rs.next()) {
					Double persentage = rs.getDouble("persentage");
					Double amount = rs.getDouble("amount");
					String senderId = rs.getString("senderUserId");
					amount = amount < 0 ? -1 * amount : amount;
					
					if(senderId.equals(userId)) {
						youSpent += persentage * amount/ 100;
					}
					else {
						youReceived += persentage * amount/ 100;
					}
					
					models.User friend = new models.User();
					friend.setUserId(senderId.equals(userId) ? rs.getString("userId"): senderId);
					friend.setEmail(rs.getString("email"));
					friend.setName(rs.getString("userName"));
					friend.setPersentage(persentage);
					friend.setAmount(persentage * amount/ 100);
					
					Category cat = new Category();
					cat.setCategoryId(rs.getString("categoryId"));
					cat.setCategoryName(rs.getString("categoryName"));
					cat.setColor(rs.getString("color"));
					cat.setImageName(rs.getString("imageName"));
					
					Transaction trans = new Transaction();
					trans.setCategory(cat);
					
					trans.setAmount(amount);
					trans.setDate(rs.getDate("date"));
					trans.setDescription(rs.getString("description"));
					trans.setIsOwn(senderId.equals(userId) ? true : false);
					trans.setTransactionId(rs.getString("transactionId"));
					trans.setTransactionName(rs.getNString("transactionName"));
					
					
					sharedTransaction.addTransaction(trans, friend);
				}
				
				JSONObject obj = new JSONObject();
				obj.put("transactions", sharedTransaction.getSharedTransactionObject());
				obj.put("youSpent", youSpent);
				obj.put("youReceive", youReceived);
				return new Pair<Integer, String>(200,
						ApiResponseHandler.apiResponse(ResponseType.SUCCESS, TransactionConstrains.transactionCreatedSuccessfuly, obj));
				
			} else {

				remove();
				return new Pair<Integer, String>(400,
						ApiResponseHandler.apiResponse(ResponseType.FAILURE, GroupConstraints.userNotFound));
			}
		} catch (Exception e) {
			System.out.println("error errror" + e);
			remove();
			return new Pair<Integer, String>(500, ApiResponseHandler.apiResponse(ResponseType.SERVERERROR));
		}
		
		
	}

}