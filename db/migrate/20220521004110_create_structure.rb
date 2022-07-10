class CreateStructure < ActiveRecord::Migration[6.0]
  def change
    # Active Storage
    create_table 'active_storage_attachments' do |t|
      t.string 'name', null: false
      t.string 'record_type', null: false
      t.bigint 'record_id', null: false
      t.bigint 'blob_id', null: false
      t.datetime 'created_at', null: false
      t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
      t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                      unique: true
    end

    create_table 'active_storage_blobs' do |t|
      t.string 'key', null: false
      t.string 'filename', null: false
      t.string 'content_type'
      t.text 'metadata'
      t.bigint 'byte_size', null: false
      t.string 'checksum', null: false
      t.datetime 'created_at', null: false
      t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
    end

    # Users
    create_table 'users' do |t|
      t.string 'email', null: false
      t.string 'encrypted_password', null: false
      t.string 'reset_password_token'
      t.datetime 'reset_password_sent_at'
      t.datetime 'remember_created_at'
      t.string 'first_name', null: false
      t.string 'last_name', null: false
      t.boolean 'remember_me', default: false
      t.string 'bio'
      t.boolean 'admin', default: false
      t.datetime 'created_at', precision: 6, null: false
      t.datetime 'updated_at', precision: 6, null: false
      t.index ['email'], name: 'index_users_on_email', unique: true
      t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
      t.integer :points, default: 0
    end

    # Publications
    create_table 'publications' do |t|
      t.string 'title', null: false
      t.string 'content', null: false
      t.string 'day', null: false
      t.string 'departure_time', null: false
      t.integer 'person_limit', null: false
      t.datetime 'created_at', precision: 6, null: false
      t.datetime 'updated_at', precision: 6, null: false
      t.bigint 'user_id', null: false
      t.index ['user_id'], name: 'index_publications_on_user_id'
      t.string :origin, limit: 200
      t.string :destination, limit: 200
    end

    # Requests
    create_table 'requests' do |t|
      t.bigint 'user_id', null: false
      t.bigint 'publication_id', null: false
      t.string 'status', null: false, default: 'pending'
      t.datetime 'created_at', precision: 6, null: false
      t.datetime 'updated_at', precision: 6, null: false
      t.index ['publication_id'], name: 'index_requests_on_publication_id'
      t.index ['user_id'], name: 'index_requests_on_user_id'
    end

    # Chats
    create_table 'chats' do |t|
      t.string 'users'
      t.string 'messages'
      t.bigint 'publication_id', null: false
      t.datetime 'created_at', precision: 6, null: false
      t.datetime 'updated_at', precision: 6, null: false
      t.index ['publication_id'], name: 'index_chats_on_publication_id'
    end

    create_table :messages do |t|
      t.integer :index, null: false
      t.string :text, null: false
      t.bigint 'user_id', null: false
      t.bigint 'chat_id', null: false
      t.timestamps
    end

    create_table :reviews do |t|
      t.integer :score
      t.references :publication, null: false, foreign_key: true
      t.timestamps
      t.integer :user_id
    end

    add_foreign_key 'messages', 'users'
    add_foreign_key 'messages', 'chats'
    add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
    add_foreign_key 'chats', 'publications'
    add_foreign_key 'publications', 'users'
    add_foreign_key 'requests', 'publications'
    add_foreign_key 'requests', 'users'
  end
end
