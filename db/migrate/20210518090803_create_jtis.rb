class CreateJtis < ActiveRecord::Migration[6.1]
  def change
    create_table :jtis, id: :uuid, comment: 'JWTのホワイトリスト' do |t|
      t.timestamps
    end
  end
end
