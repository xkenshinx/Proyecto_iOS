//
//  ArtistaViewController.h
//  KenSpotifyStreamer
//
//  Created by Kenshin on 8/15/15.
//  Copyright (c) 2015 Kenshin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Spotify/Spotify.h>
#import <Foundation/Foundation.h>

@interface ArtistaViewController : UITableViewController <UISearchBarDelegate>
@property(nonatomic, strong) IBOutlet UISearchBar* ArtistaSearchBar;

-(void) updateArtista:(NSMutableArray*)nuevoArtista;

//-(void) requestBusquedaArtista:(NSString*)nombreArtista;

@end
