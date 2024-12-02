require 'rails_helper'

describe 'User create role' do
  it 'conected to film' do
    user = User.create!(email: 'david@email.com', password: '123456789')
    Movie.create!(title: 'Jurassic Park', year: 1993, director: 'Steven Spielberg', 
              plot:  'Os paleontólogos Alan Grant, Ellie Sattler e o matemático Ian Malcolm fazem parte de um seleto grupo escolhido para visitar uma ilha habitada por dinossauros criados a partir de DNA pré-histórico. O idealizador do projeto e bilionário John Hammond garante a todos que a instalação é completamente segura. Mas após uma queda de energia, os visitantes descobrem, aos poucos, que vários predadores ferozes estão soltos e à caça.')

    login_as(user)
    visit root_path
    click_on 'Cadastrar Ator'
    fill_in 'Nome', with: 'Laura Dern'  
    click_on 'Criar Ator'
    fill_in 'Nome', with: 'Ellie Sattler'
    select 'Jurassic Park', from: 'Filmes'
    click_on 'Adicionar Papel'

    expect(page).to have_content 'Cadastrar Papel'
    expect(page).to have_content 'Ellie Sattler - Jurassic Park!'
  end
end
