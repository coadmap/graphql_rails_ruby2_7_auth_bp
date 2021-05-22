class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :accounts, id: :uuid, comment: "アカウント" do |t|
      t.string :email, null: false, comment: 'メールアドレス'
      t.string :password_digest, null: false, comment: 'パスワードのハッシュ値'
      t.string :username, null: false, comment: 'ユーザーネーム'
      t.integer :email_verification_status, null: false, default: 0, comment: 'メールアドレスの確認状態'
      t.uuid :email_verification_token, comment: 'メール確認用トークン'

      t.timestamps
    end

    add_index :accounts, :email, unique: true
  end
end
