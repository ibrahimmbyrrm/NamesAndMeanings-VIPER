# NamesAndMeanings-VIPER

In this application, everyone will be able to find all turkish names, and the meaning of name which they entered.Also when user clicked the name on tableView, they can see some details about selected name.For example, you can see the origin, meaning, gender of the name.In addition user will be able to learn is selected name is in the Quran.Let's talk technicaly!I used VIPER architecture in this project.There are 2 modules in app.List Module and Detail Module.Both modules have their own view, interactor, presenter and routers.I transfered datas benefitted from protocols.In Network Layer, i created a Network Helper.I created some enums in Helper like HTTP Methods, HTTP Errors and Base URLs.Also i have a class provides http headers.I also created NetworkManager file.In this file i have 1 fetch function and 1 handler function to call API.These functions works with Generic Type.So i can fetch name list and name details with just one function.I created shared instance to use singleton patter.
Here are some photos of my app:


<img width="376" alt="Ekran Resmi 2023-04-05 15 51 46" src="https://user-images.githubusercontent.com/96320314/230088215-f29ba167-1597-4efd-a643-6662b4eab151.png"><img width="376" alt="Ekran Resmi 2023-04-05 15 51 55" src="https://user-images.githubusercontent.com/96320314/230088225-c326ed23-e236-4e31-bfa4-ebd9626b625b.png">
<img width="376" alt="Ekran Resmi 2023-04-05 15 52 09" src="https://user-images.githubusercontent.com/96320314/230088232-7d755550-60da-412c-abf9-99d68dc07bc8.png">
<img width="376" alt="Ekran Resmi 2023-04-05 15 52 15" src="https://user-images.githubusercontent.com/96320314/230088240-02d8b1ec-e6d2-4904-b3ed-03a9d2262d0b.png">
