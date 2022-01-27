describe 'Api Users metodo GET' do

    context 'Consulta usuario' do
        before(:context) do
            @users = User.get('/public-api/users?page=1')
            @id = @users['data'][3]['id'].to_s
            @userPost = User.get('/public-api/users/'+ @id +'/posts')
        end
    
        it 'Retorna status code 200' do
            expect(@userPost.code).to eq(200)
            puts @userPost
        end

        it 'Retorna regras de meta' do
            expect(@userPost['meta']['pagination']['total']).not_to be nil
            expect(@userPost['meta']['pagination']['pages']).not_to be nil
            expect(@userPost['meta']['pagination']['page']).not_to be nil
            expect(@userPost['meta']['pagination']['limit']).not_to be nil
        end

        it 'Retorna data' do
            binding.pry
            expect(@userPost['data'][0]['id']).not_to be nil
            expect(@userPost['data'][0]['user_id']).not_to be nil
            expect(@userPost['data'][0]['title']).not_to be nil
            expect(@userPost['data'][0]['body']).not_to be nil
        end
    
    end
end