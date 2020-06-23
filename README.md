# 18銅人

![avatar](/database.png)

## User model
|  user  | 資料型態 |
|  ----  | ----     |
| name   | text     |
| email  | text     |
| password | text |
| create_at | datatime |
| update_at | datatime |

## Mission model
| mission | 資料型態 |
| ---- | ---- |
| name | text |
| description | text |
| start_at | datatime |
| end_at | datatime |
|create_at| datatime |
| update_at| datatime |
| priority | enum |
| status | enum |

## Tag model
| tag | 資料型態 |
| ---- | ---- |
| create_ at| datatime |
| update_at | datatime |
| name | text |

## 6/18
![avatar](/6-18_db_create.png)

## 佈署到 heroku
[佈署連結](https://training5xruby.herokuapp.com/)
[過程紀錄 Medium](https://medium.com/%E5%BB%A2%E7%89%A9%E5%88%B0%E5%B7%A5%E7%A8%8B%E5%B8%AB%E7%9A%84%E9%80%B2%E5%8C%96%E9%81%8E%E7%A8%8B/%E4%BD%BF%E7%94%A8-windows-%E5%9C%A8-ubuntu-wsl-%E5%85%A7%E4%BD%BF%E7%94%A8-heroku-d872e612bef9)
