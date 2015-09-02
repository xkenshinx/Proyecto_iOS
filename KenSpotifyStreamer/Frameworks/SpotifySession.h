//
//  SpotifySession.h
//  KenSpotifyStreamer
//
//  Created by Kenshin on 9/1/15.
//  Copyright (c) 2015 Kenshin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Spotify/Spotify.h>
#import <Foundation/Foundation.h>
#import "ArtistaViewController.h"

@interface SpotifySession : NSObject

@property (nonatomic, strong) SPTSession *session;

+(void) buscaArtista:(NSString*)artista withTarget:(ArtistaViewController*)target;
+(SPTSession*) getSession;
+(void) setSession:(SPTSession *)session;

@end
