class Mission < ApplicationRecord
  enum status: {"待處理": 0, "進行中": 1, "已完成": 2}
  enum order: {"低": 0, "中": 1, "高": 2}
end
