Rank.delete_all
User.delete_all

user1 = User.create(id: 1, name: "aaa")
user2 = User.create(id: 2, name: "bbb")
user3 = User.create(id: 3, name: "ccc")
user4 = User.create(id: 4, name: "ddd")
user5 = User.create(id: 5, name: "eee")

UserScore.create(user_id: user1.id, score: 3, received_at: Time.current)
UserScore.create(user_id: user1.id, score: 4, received_at: Time.current)
UserScore.create(user_id: user1.id, score: 1, received_at: Time.current)

UserScore.create(user_id: user2.id, score: 2, received_at: Time.current)
UserScore.create(user_id: user2.id, score: 2, received_at: Time.current)
UserScore.create(user_id: user2.id, score: 4, received_at: Time.current)

UserScore.create(user_id: user3.id, score: 1, received_at: Time.current)
UserScore.create(user_id: user3.id, score: 1, received_at: Time.current)
UserScore.create(user_id: user3.id, score: 1, received_at: Time.current)

UserScore.create(user_id: user4.id, score: 0, received_at: Time.current)
UserScore.create(user_id: user4.id, score: 1, received_at: Time.current)
UserScore.create(user_id: user4.id, score: 0, received_at: Time.current)

UserScore.create(user_id: user5.id, score: 3, received_at: Time.current)
UserScore.create(user_id: user5.id, score: 3, received_at: Time.current)
UserScore.create(user_id: user5.id, score: 3, received_at: Time.current)
