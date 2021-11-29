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
    public func provideHomepageViewModel() -> HomePageViewModelProtocol {
        let homeVm = HomepageViewModel(homeInteractor: provideHomeInteractor())
        return homeVm
    }
    
    public func provideHomeInteractor() -> HomePageInteractorProtocol {
        let homeInteractor = HomepageInteractor(gameFetchService: provideGameService())
        return homeInteractor
    }
    
    public func provideGameService() -> GameProtocol {
        return GameApiFetch.shared
    }
    
    // MARK: DETAIL PAGE
    public func provideDetailPageViewModel() -> DetailPageViewModelProtocol {
        let detailPageVm = DetailPageViewModel(detailInteractor: provideDetailPageInteractor())
        return detailPageVm
    }
    
    public func provideDetailPageInteractor() -> DetailPageInteractorProtocol {
        let detailPageInt = DetailPageInteractor(repoService: provideCoreDataService())
        return detailPageInt
    }
    
    public func provideCoreDataService() -> localRepoProtocol {
        let repoService = CoreDataService.shared
        return repoService
    }
    
    // MARK: FAVOURITE
    public func provideFavouriteViewModel() -> FavouriteViewModelProtocol {
        let favVm = FavouriteViewModel(favInteractor: provideFavInteractor())
        return favVm
    }
    
    public func provideFavInteractor() -> FavouriteInteactorProtocol {
        let favInt = FavouriteInteractor(repoService: provideCoreDataService())
        return favInt
    }

    // MARK: DETAIL FAVORITE
    public func provideDetailFavViewModel() -> DetailFavViewModelProtocol {
        let detailFavVm = DetailFavViewModel(detailFavInteractor: provideDetailFavInteractor())
        return detailFavVm
    }
    
    public func provideDetailFavInteractor() -> DetailFavInteractorProtocol {
        let detailFavInt = DetailFavInteractor(searchService: provideSearchService())
        return detailFavInt
    }
    
    public func provideSearchService() -> SearchProtocol {
        let searchService = SearchService.shared
        return searchService
    }
    
    // MARK: SEARCH
    
    public func provideSearchViewModel() -> SearchViewModelProtocol {
        let searchVm = SearchViewModel(searchInteractorProtocol: provideSearchInteractor())
        return searchVm
    }
    
    public func provideSearchInteractor() -> SearchInteractorProtocol {
        let searchInt = SearchInteractor(searchService: provideSearchService())
        return searchInt
    }

}
