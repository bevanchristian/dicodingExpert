//
//  DI.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 31/10/21.
//

import Foundation

class DependencyInjection {
    
    // MARK: HOMEPAGE
    func provideHomepageViewModel() -> HomePageViewModelProtocol {
        let homeVm = HomepageViewModel(homeInteractor: provideHomeInteractor())
        return homeVm
    }
    
    private func provideHomeInteractor() -> HomePageInteractorProtocol {
        let homeInteractor = HomepageInteractor(gameFetchService: provideGameService())
        return homeInteractor
    }
    
    private func provideGameService() -> GameProtocol {
        return GameApiFetch.shared
    }
    
    // MARK: DETAIL PAGE
    func provideDetailPageViewModel() -> DetailPageViewModelInteractor {
        let detailPageVm = DetailPageViewModel(detailInteractor: provideDetailPageInteractor())
        return detailPageVm
    }
    
    private func provideDetailPageInteractor() -> DetailPageInteractorProtocol {
        let detailPageInt = DetailPageInteractor(repoService: provideCoreDataService())
        return detailPageInt
    }
    
    private func provideCoreDataService() -> localRepoProtocol {
        let repoService = CoreDataService.shared
        return repoService
    }
    
    // MARK: FAVOURITE
    func provideFavouriteViewModel() -> FavouriteViewModelProtocol {
        let favVm = FavouriteViewModel(favInteractor: provideFavInteractor())
        return favVm
    }
    
    private func provideFavInteractor() -> FavouriteInteactorProtocol {
        let favInt = FavouriteInteractor(repoService: provideCoreDataService())
        return favInt
    }

    // MARK: DETAIL FAVORITE
    func provideDetailFavViewModel() -> DetailFavViewModelProtocol {
        let detailFavVm = DetailFavViewModel(detailFavInteractor: provideDetailFavInteractor())
        return detailFavVm
    }
    
    private func provideDetailFavInteractor() -> DetailFavInteractorProtocol {
        let detailFavInt = DetailFavInteractor(searchService: provideSearchService())
        return detailFavInt
    }
    
    private func provideSearchService() -> SearchProtocol {
        let searchService = SearchService.shared
        return searchService
    }
    
    // MARK: SEARCH
    
    func provideSearchViewModel() -> SearchViewModelProtocol {
        let searchVm = SearchViewModel(searchInteractorProtocol: provideSearchInteractor())
        return searchVm
    }
    
    private func provideSearchInteractor() -> SearchInteractorProtocol {
        let searchInt = SearchInteractor(searchService: provideSearchService())
        return searchInt
    }

}
