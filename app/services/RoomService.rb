require 'http'

module Cryal
    class RoomService
        class RoomSystemError < StandardError; end
        class MyRoomError < StandardError; end
        class GetRoom < StandardError; end
        def initialize(config)
            @config = config
        end

        def getroom(routing, current_account, room_id)
            # puts current_account.auth_token
            headers = { 'Authorization' => "Bearer #{current_account.auth_token}", 'Content-Type' => 'application/json' }
            response = HTTP.get("#{@config.API_URL}/rooms?room_id=#{room_id}", headers: )
            # puts JSON.parse(response.body)
            # puts response.code
            raise(MyRoomError) unless response.code == 200
            body = JSON.parse(response.body)
            data = body['data'] if body['data']
            puts "The data is #{data}"
            data
        end

        def myroom(routing, current_account)
            # puts current_account.auth_token
            headers = { 'Authorization' => "Bearer #{current_account.auth_token}", 'Content-Type' => 'application/json' }
            response = HTTP.get("#{@config.API_URL}/rooms", headers: )
            # puts JSON.parse(response.body)
            # puts response.code
            raise(MyRoomError) unless response.code == 200
            body = JSON.parse(response.body)
            data = body['data'] if body['data']
            # puts data
            data
        end

        def create(routing, current_account)
            # /api/v1/rooms/createroom
            headers = { 'Authorization' => "Bearer #{current_account.auth_token}", 'Content-Type' => 'application/json' }
            response = HTTP.post("#{@config.API_URL}/rooms/createroom",
                            json: {room_name: routing.params['room_name'], room_description: routing.params['room_description'],
                                    room_password: routing.params['room_password']}, headers: headers)

            raise(RoomSystemError) unless response.code == 201

            body = JSON.parse(response.body)
            data = body['data'] if body['data']
            room_data = data

            # because create room, must continue to join the room
            room_id = room_data['room_id']
            response_join_room = HTTP.post("#{@config.API_URL}/rooms/joinroom",
                                  json: {room_id: room_id , room_password: routing.params['room_password'],
                                  active: true, authority: 'admin'}, headers: headers)

            raise(RoomSystemError) unless response.code == 201
            room_data
        end

        def join(routing, current_account)
            # /api/v1/rooms/joinroom
            headers = { 'Authorization' => "Bearer #{current_account.auth_token}", 'Content-Type' => 'application/json' }
            response = HTTP.post("#{@config.API_URL}/rooms/joinroom",
                                  json: {room_id: routing.params['room_id'] , room_password: routing.params['room_password'],
                                  active: true, authority: 'member'}, headers: headers)

            raise(RoomSystemError) unless response.code == 201
            body = JSON.parse(response.body)
            data = body['data'] if body['data']
            data
        end
    end
end
