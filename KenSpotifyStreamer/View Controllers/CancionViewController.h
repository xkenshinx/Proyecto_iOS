//
//  CancionViewController.h
//  KenSpotifyStreamer
//
//  Created by Kenshin on 9/9/15.
//  Copyright (c) 2015 Kenshin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Spotify/Spotify.h>
#import <Foundation/Foundation.h>

@interface CancionViewController : UITableViewController

@property (nonatomic, strong) SPTArtist* artista;
@property (nonatomic,strong) NSMutableArray* canciones;

-(void) updateCanciones:(NSMutableArray*) nuevaCancion;

@end
