# coding: utf-8

User.create!( name: "管理人",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password")

Task.create!( title: "タスク",
              note: "タスク詳細",
              user_id: "1")