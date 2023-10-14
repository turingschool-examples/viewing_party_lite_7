# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieCredits do
  it 'exists' do
    attrs = {
      "id": 238,
      "cast": [
        {
          "adult": false,
          "gender": 2,
          "id": 3084,
          "known_for_department": 'Acting',
          "name": 'Marlon Brando',
          "original_name": 'Marlon Brando',
          "popularity": 27.628,
          "profile_path": '/eEHCjqKMWSvQU4bmwhLMsg4RtEr.jpg',
          "cast_id": 146,
          "character": 'Don Vito Corleone',
          "credit_id": '6489aa85e2726001072483a9',
          "order": 0
        },
        {
          "adult": false,
          "gender": 2,
          "id": 1158,
          "known_for_department": 'Acting',
          "name": 'Al Pacino',
          "original_name": 'Al Pacino',
          "popularity": 46.93,
          "profile_path": '/fMDFeVf0pjopTJbyRSLFwNDm8Wr.jpg',
          "cast_id": 147,
          "character": 'Michael Corleone',
          "credit_id": '6489aa936f8d9500afdf219c',
          "order": 1
        },
        {
          "adult": false,
          "gender": 2,
          "id": 3085,
          "known_for_department": 'Acting',
          "name": 'James Caan',
          "original_name": 'James Caan',
          "popularity": 21.628,
          "profile_path": '/v3flJtQEyczxENi29yJyvnN6LVt.jpg',
          "cast_id": 148,
          "character": 'Sonny Corleone',
          "credit_id": '6489aabc99259c00ff111136',
          "order": 2
        },
        {
          "adult": false,
          "gender": 2,
          "id": 3087,
          "known_for_department": 'Acting',
          "name": 'Robert Duvall',
          "original_name": 'Robert Duvall',
          "popularity": 27.45,
          "profile_path": '/nLBIEvJDvSV0WhFv0bi7sU9tLyb.jpg',
          "cast_id": 149,
          "character": 'Tom Hagen',
          "credit_id": '6489aace99259c011c42808d',
          "order": 3
        },
        {
          "adult": false,
          "gender": 2,
          "id": 3086,
          "known_for_department": 'Acting',
          "name": 'Richard S. Castellano',
          "original_name": 'Richard S. Castellano',
          "popularity": 9.693,
          "profile_path": '/1vr75BdHWret81vuSJ3ugiCBkxw.jpg',
          "cast_id": 150,
          "character": 'Clemenza',
          "credit_id": '6489aaf86f8d9500c88bea14',
          "order": 4
        },
        {
          "adult": false,
          "gender": 1,
          "id": 3092,
          "known_for_department": 'Acting',
          "name": 'Diane Keaton',
          "original_name": 'Diane Keaton',
          "popularity": 20.859,
          "profile_path": '/tnx7pJqisfAzvXOR5wHQsbnH9XH.jpg',
          "cast_id": 151,
          "character": 'Kay Adams',
          "credit_id": '6489ab23bf31f25055a33a46',
          "order": 5
        },
        {
          "adult": false,
          "gender": 1,
          "id": 3094,
          "known_for_department": 'Acting',
          "name": 'Talia Shire',
          "original_name": 'Talia Shire',
          "popularity": 21.899,
          "profile_path": '/RkFJejmEKM80ly6fPSN7octO5c.jpg',
          "cast_id": 152,
          "character": 'Connie Corleone Rizzi',
          "credit_id": '6489ab5799259c011c4280d8',
          "order": 6
        },
        {
          "adult": false,
          "gender": 2,
          "id": 3095,
          "known_for_department": 'Acting',
          "name": 'Gianni Russo',
          "original_name": 'Gianni Russo',
          "popularity": 11.509,
          "profile_path": '/5fjg2WPvuk1NvUpLyQ7aMJqOqy.jpg',
          "cast_id": 153,
          "character": 'Carlo Rizzi',
          "credit_id": '6489ab77e375c00139c26e5b',
          "order": 7
        },
        {
          "adult": false,
          "gender": 2,
          "id": 3088,
          "known_for_department": 'Acting',
          "name": 'Sterling Hayden',
          "original_name": 'Sterling Hayden',
          "popularity": 10.356,
          "profile_path": '/dCTe6BsGSp9QTcva2Pz4wbxxYMY.jpg',
          "cast_id": 154,
          "character": 'Captain McCluskey',
          "credit_id": '6489abe0d2b209014e0b8df9',
          "order": 8
        },
        {
          "adult": false,
          "gender": 2,
          "id": 3142,
          "known_for_department": 'Acting',
          "name": 'John Marley',
          "original_name": 'John Marley',
          "popularity": 5.587,
          "profile_path": '/k8YnXZDhhn28bSE75tLz9juR46u.jpg',
          "cast_id": 155,
          "character": 'Jack Woltz',
          "credit_id": '6489ac0299259c011c42811f',
          "order": 9
        },
        {
          "adult": false,
          "gender": 2,
          "id": 3090,
          "known_for_department": 'Acting',
          "name": 'Richard Conte',
          "original_name": 'Richard Conte',
          "popularity": 9.463,
          "profile_path": '/bDegodf4dYGXMejdm4T6XgOJwlr.jpg',
          "cast_id": 156,
          "character": 'Barzini',
          "credit_id": '6489ac126f8d9500afdf2251',
          "order": 10
        },
        {
          "adult": false,
          "gender": 2,
          "id": 3091,
          "known_for_department": 'Acting',
          "name": 'Al Lettieri',
          "original_name": 'Al Lettieri',
          "popularity": 8.403,
          "profile_path": '/fE5mEWPkkVJlCji0EoKht8PYw89.jpg',
          "cast_id": 157,
          "character": 'Sollozzo',
          "credit_id": '6489ac20e375c000acc796d1',
          "order": 11
        },
        {
          "adult": false,
          "gender": 2,
          "id": 3093,
          "known_for_department": 'Acting',
          "name": 'Abe Vigoda',
          "original_name": 'Abe Vigoda',
          "popularity": 10.08,
          "profile_path": '/luWKPNb58IgJ2ovrtgPAzHGLLYL.jpg',
          "cast_id": 158,
          "character": 'Sal Tessio',
          "credit_id": '6489ac2dbf31f2505708a65c',
          "order": 12
        }
      ]
    }
    credits = MovieCredits.new(attrs)

    expect(credits).to be_a MovieCredits
    expect(credits.cast).to be_an Array
    expect(credits.cast.count).to eq(10)
    expect(credits.cast.last).to eq({
                                      "adult": false,
                                      "gender": 2,
                                      "id": 3142,
                                      "known_for_department": 'Acting',
                                      "name": 'John Marley',
                                      "original_name": 'John Marley',
                                      "popularity": 5.587,
                                      "profile_path": '/k8YnXZDhhn28bSE75tLz9juR46u.jpg',
                                      "cast_id": 155,
                                      "character": 'Jack Woltz',
                                      "credit_id": '6489ac0299259c011c42811f',
                                      "order": 9
                                    })
  end
end
