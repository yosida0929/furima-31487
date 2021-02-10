class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string     :title                , null: false
      t.text       :text                 , null: false
      t.integer    :shipping_cost_id     , null: false
      t.integer    :shipping_days_id     , null: false
      t.integer    :prefecture_id        , null: false
      t.integer    :category_id          , null: false
      t.integer    :shipping_status_id   , null: false
      t.integer    :price                , null: false

      t.timestamps
    end
  end
end
