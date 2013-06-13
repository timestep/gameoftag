#!/usr/bin/env ruby -wKU

require "test/unit"
require "../database.rb"

class DatabaseTest < Test::Unit::TestCase

	def setup
		@testdatabase = Database.new
		@testuser = User.new
	end

	def test_can_make_new_data_base
		assert @testdatabase
	end

	# def test_database_initialize
	# 	assert @testdatabase.database.is_a? Array
	# end

	def test_database_initialize_creates_empty_array
		assert_equal [], @testdatabase.database
	end

	# def test_make_new_contact
	# 	assert @contact 
	# end

	# def test_contact_initialize_creates_empty_hash
	# 	assert @testcontact.contact.is_a? Hash
	# end

	def test_check_contact_add
		@testdatabase.add_user(@testuser.user)
		assert @testdatabase.database[0].is_a? Hash
	end

	def test_check_user_delete
		user_to_add_then_delete = {}
		@testdatabase.add_user(user_to_add_then_delete)
		@testdatabase.delete_user(user_to_add_then_delete)
		assert_equal false, (@testdatabase.database.include? user_to_add_then_delete)
	end

	def test_unique_user
		user1 = {:user=>"ruff"}
		user2 = {:user=>"ruff"}
		@testdatabase.add_user(user1)
		@testdatabase.add_user(user2)
		assert_equal nil, @testdatabase.database[1]
	end

	def test_user_initialize_creates_hash_with_keys_with_nil_values
		assert_equal nil, @testuser.user[:user]
		assert_equal nil, @testuser.user[:tagstate]
	end

	def test_user_contains_information
		person = ["John", false]
		@testdatabase.add_user(@testuser.convert_input_to_hash(person))	
		assert_equal person[0], @testdatabase.database[0].fetch(:user)
		assert_equal person[1], @testdatabase.database[0].fetch(:tagstate)
		
	end

	def test_add_user_rejects_non_hash
		person = ["John","Smith","yol@mlg.com",416988000,"League of Legends is Da Best"]
		@testdatabase.add_user(person)
		assert_equal [], @testdatabase.database
	end

	def test_add_string
		user1 = ["John","Smith"]
		user2 = ["Rocky","Balboa"]
		u1=@testuser.convert_input_to_hash(user1)
		u2=@testuser.convert_input_to_hash(user2)
		assert u1.is_a? Hash
		assert u2.is_a? Hash
	end

	def test_convert_only_accepts_arrays_with_5_parameters
		person1 = ["John","Smith","yol@mlg.com",416988000]
		person2 = "this is a string"
		assert_equal false, @testuser.convert_input_to_hash(person1)
		assert_equal false, @testuser.convert_input_to_hash(person2)
	end

	def test_find_user
		person1 = ["John","Smith"]
		person2 = ["Rocky","Balboa"]
		@testdatabase.add_user(@testuser.convert_input_to_hash(person1))
		@testdatabase.add_user(@testuser.convert_input_to_hash(person2))
		assert_equal @testdatabase.database[1], @testdatabase.find_user("Rocky")
		assert_equal @testdatabase.database[0], @testdatabase.find_user("John")
	end

	# def test_find_user_with_lastname
	# 	person1 = {:user=>"John", :lastname=>"Smith"}
	# 	person2 = {:user=>"Rocky", :lastname=>"Balboa"}
	# 	@testdatabase.add_user(person1)
	# 	@testdatabase.add_user(person2)
	# 	assert_equal @testdatabase.database[1], @testdatabase.find_user_with_lastname("Balboa")
	# 	assert_equal @testdatabase.database[0], @testdatabase.find_user_with_lastname("Smith")
	# end

	# def test_find_email_with_any_parameter
	# 	person1 = ["John","Smith"]
	# 	person2 = ["Rocky","Balboa"]
	# 	@testdatabase.add_user(@testuser.convert_input_to_hash(person1))
	# 	@testdatabase.add_user(@testuser.convert_input_to_hash(person2))
	# 	assert_equal person2[2], @testdatabase.find_email("Rocky")
	# 	assert_equal person1[2], @testdatabase.find_email("Smith")
	# end

	def test_find_user_with_tagstate
		user1 = ['john',true]
		user2 = ['rob',false]

		@testdatabase.add_user(@testuser.convert_input_to_hash(user1))
		@testdatabase.add_user(@testuser.convert_input_to_hash(user2))

		assert_equal @testdatabase.database[0], @testdatabase.find_user_with_tagstate

	end

	def test_modify_user
		person1 = ["John","Smith"]
		person2 = ["Rocky","Balboa"]
		@testdatabase.add_user(@testuser.convert_input_to_hash(person1))
		@testdatabase.add_user(@testuser.convert_input_to_hash(person2))
		assert_equal false, @testdatabase.modify_user("John","tagstate", false)
		assert_equal "Bob", @testdatabase.modify_user("John","user","Bob")
	end

	def test_modifty_tag_state
		user1 = ['john',true]
		user2 = ['rob',false]

		@testdatabase.add_user(@testuser.convert_input_to_hash(user1))
		@testdatabase.add_user(@testuser.convert_input_to_hash(user2))

	end


end