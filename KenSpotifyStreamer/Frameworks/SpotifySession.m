//
//  SpotifySession.m
//  KenSpotifyStreamer
//
//  Created by Kenshin on 9/1/15.
//  Copyright (c) 2015 Kenshin. All rights reserved.
//

#import "SpotifySession.h"

@implementation SpotifySession

#pragma mark - Funciones de Spotify

static SPTSession* session = nil;

+(void)buscaArtista:(NSString *)artista withTarget:(ArtistaViewController *)target{
    if([self getSession] != nil){
        [SPTSearch performSearchWithQuery:artista queryType:SPTQueryTypeArtist accessToken:[self getSession].accessToken callback:
         ^(NSError *error, id object) {
             if (error != nil || [(SPTListPage*)object items].count <= 0) {
                 NSLog(@"*** Error buscando un Artista %@", error);
                 return;
                 
             }
             NSArray* results = [(SPTListPage*)object items];
             NSMutableArray* mResults = [NSMutableArray arrayWithArray:results];
             NSLog(@"Resultados del Search: \n%@", results);
             [target updateArtista:mResults];
             
         }];
    }
    else{
        NSLog(@"Session Nula!");
    }
    
}


+(void) buscaTopSongs:(SPTArtist *)artista withTarget:(CancionViewController *)target{
    [artista requestTopTracksForTerritory:@"us" withSession:[self getSession] callback:^(NSError *error, id object) {
        if (error != nil) {
            NSLog(@"Error Buscando las Canciones Top %@. Error:\n%@", artista.name, error);
            return;
        }
        NSArray* results = object;
        NSMutableArray* mResults = [NSMutableArray arrayWithArray:results];
        [target updateCanciones:mResults];
    }];
}

+(SPTSession*) getSession{
    return session;
}

+(void) setSession:(SPTSession *)newSession{
    session = newSession;
}
@end
