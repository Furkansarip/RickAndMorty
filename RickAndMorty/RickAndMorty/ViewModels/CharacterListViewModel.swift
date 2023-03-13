//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Furkan Sarı on 13.03.2023.
//

import UIKit

final class CharacterListViewModel: NSObject {
    
    func fetchCharacters() {
        RMService.shared.execute(.listCharactersRequest, expecting: GetAllCharactersResponse.self) { result in
            switch result {
            case .success(let success):
                print(String(describing: success.results.first?.image))
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}

extension CharacterListViewModel: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.reuseID, for: indexPath) as? CharacterCell else {
            return UICollectionViewCell()
        }
        let viewModel = CharacterCellViewModel(characterName: "Furkan", characterStatus: .alive, characterImageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30)/2
        return CGSize(width: width, height: width * 1.5)
    }
    
    
}
