# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  # create_table "comments", force: :cascade do |t|
  #   t.string   "title"
  #   t.string   "date"
  #   t.string   "content"
  #   t.string   "video"
  #   t.integer  "user_id"
  #   t.integer  "topic_id"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  # end

  # add_index "comments", ["topic_id"], name: "index_comments_on_topic_id", using: :btree
  # add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  # create_table "topics", force: :cascade do |t|
  #   t.string   "title"
  #   t.string   "date"
  #   t.string   "content"
  #   t.integer  "user_id"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.string   "video"
  # end

  # add_index "topics", ["user_id"], name: "index_topics_on_user_id", using: :btree

  # create_table "users", force: :cascade do |t|
  #   t.string   "name"
  #   t.string   "gender"
  #   t.string   "location"
  #   t.string   "email"
  #   t.string   "password_digest"
  #   t.datetime "created_at",          null: false
  #   t.datetime "updated_at",          null: false
  #   t.string   "avatar_file_name"
  #   t.string   "avatar_content_type"
  #   t.integer  "avatar_file_size"
  #   t.datetime "avatar_updated_at"


c = User.new
c.name = "James"
c.gender = "Male"
c.location = "London"
c.email = "j@j.com"
c.password = "j"
c.password_confirmation = "j"
c.save

t = Topic.create({
  title: "Handstand",
  date: "April 12, 2016",
  content: "Is this ok?",
  user_id: c.id,
  video: "https://www.youtube.com/watch?v=ctunmnwbbSI"
})

z = Comment.create({
  date: "April 15, 2016",
  content: "No its horrible",
  user_id: c.id,
  topic_id: t.id
})
