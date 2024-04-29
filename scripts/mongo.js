db.createUser(
    {
      user: "test",
      pwd: "test",
      roles: [
        { role: "readWrite", db: "test" }
      ]
    }
  )

db.createUser(
    {
        user: "zetpepe",
        pwd: "zetpepe",
        roles: [
            { role: "read", db: "test" }
        ]
    }
)
  