//
//  DI.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 31/10/21.
//

import Foundation
public class DependencyInjection {
    
    public init() {}
    
    // MARK: HOMEPAGE
    func provideHomepageViewModel() -> HomePageViewModelProtocol {
        let homeVm = HomepageViewModel(homeInteractor: provideHomeInteractor())
        return homeVm
    }
    
    func provideHomeInteractor() -> HomePageInteractorProtocol {
        let homeInteractor = HomepageInteractor(gameFetchService: provideGameService())
        return homeInteractor
    }
    
    func provideGameService() -> GameProtocol {
        return GameApiFetch.shared
    }
    
    // MARK: DETAIL PAGE
    func provideDetailPageViewModel() -> DetailPageViewModelProtocol {
        let detailPageVm = DetailPageViewModel(detailInteractor: provideDetailPageInteractor())
        return detailPageVm
    }
    
    func provideDetailPageInteractor() -> DetailPageInteractorProtocol {
        let detailPageInt = DetailPageInteractor(repoService: provideCoreDataService())
        return detailPageInt
    }
    
    func provideCoreDataService() -> localRepoProtocol {
        let repoService = CoreDataService.shared
        return repoService
    }
    
    // MARK: FAVOURITE
    func provideFavouriteViewModel() -> FavouriteViewModelProtocol {
        let favVm = FavouriteViewModel(favInteractor: provideFavInteractor())
        return favVm
    }
    
    func provideFavInteractor() -> FavouriteInteactorProtocol {
        let favInt = FavouriteInteractor(repoService: provideCoreDataService())
        return favInt
    }

    // MARK: DETAIL FAVORITE
    func provideDetailFavViewModel() -> DetailFavViewModelProtocol {
        let detailFavVm = DetailFavViewModel(detailFavInteractor: provideDetailFavInteractor())
        return detailFavVm
    }
    
    func provideDetailFavInteractor() -> DetailFavInteractorProtocol {
        let detailFavInt = DetailFavInteractor(searchService: provideSearchService())
        return detailFavInt
    }
    
    func provideSearchService() -> SearchProtocol {
        let searchService = SearchService.shared
        return searchService
    }
    
    // MARK: SEARCH
    
    func provideSearchViewModel() -> SearchViewModelProtocol {
        let searchVm = SearchViewModel(searchInteractorProtocol: provideSearchInteractor())
        return searchVm
    }
    
    func provideSearchInteractor() -> SearchInteractorProtocol {
        let searchInt = SearchInteractor(searchService: provideSearchService())
        return searchInt
    }

}
