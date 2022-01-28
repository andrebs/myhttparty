describe 'Api Create Users metodo Post' do

    context 'Criando usuario' do
        
        before(:context) do
            email = Faker::Internet.email
            name = Faker::Name.name 

            @headers = {
                'Authorization'=> 'Bearer 9fee0fe10edcd69d867e5044f8e9ead4e4f0c9061eda35697db5ab531666f497',
                'Content-Type'=> 'application/json'
            }

            @body = {
                'name': name,
                'gender': 'male',
                'email': email,
                'status': 'active'
            }.to_json

            #@authorization = {'Authorization': 'Bearer 9fee0fe10edcd69d867e5044f8e9ead4e4f0c9061eda35697db5ab531666f497'}

            binding.pry
            @users = User.post('/public/v1/users', :headers => @headers, :body => @body)
        end
    
        it 'Retorna status code 201' do
            expect(@users.code).to eq(201)
            puts @users
        end

        it 'Retorna regras de meta' do
            expect(@users['meta']['pagination']['total']).not_to be nil
            expect(@users['meta']['pagination']['pages']).not_to be nil
            expect(@users['meta']['pagination']['page']).not_to be nil
            expect(@users['meta']['pagination']['limit']).not_to be nil
        end

        it 'Valida data' do
            expect(@users['data'][0]['id']).not_to be nil
            expect(@users['data'][0]['user_id']).not_to be nil
            expect(@users['data'][0]['title']).not_to be nil
            expect(@users['data'][0]['body']).not_to be nil
        end

    end
end