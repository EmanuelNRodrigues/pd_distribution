
pp 'SEEDING DB!'

admin_user = User.create!(email: 'admin@test.pt', is_admin: true, password: '123456', password_confirmation: '123456')
normal_user = User.create!(email: 'user@test.pt', is_admin: false, password: '412312', password_confirmation: '412312')

AddressInformation.find_or_create_by!(name: 'Admin', address1: 'rua do Admin n35 4DIR FRENTE', postal_code1: 4755, postal_code2: 999, city: 'ADMIN - Varcelos', phone_number: '1231333323', addressable_type:'User', addressable_id: admin_user.id)
AddressInformation.find_or_create_by!(name: 'User', address1: 'Travessa do Caixote do Lixo n12', address2: 'Res do Chao do User', postal_code1: 4700, postal_code2: 111, city: 'USER - Varcelos', phone_number: '1221211212', addressable_type:'User', addressable_id: normal_user.id)

order = Order.find_or_create_by!(collected_at: 2.hours.ago, comments: 'comentario desnecessario', packets_count: 2, services: 'dos bons', status: :warehouse, weight: '1kg', user_id: normal_user.id)

AddressInformation.find_or_create_by!(name: 'Recipient1', address1: 'Av. do Recipiente 3523', address2: '3o Dir Frente Lado', postal_code1: 2000, postal_code2: 231, city: 'Recipient - Ramada', phone_number: '1231', addressable_type: 'Order', addressable_id: order.id)
