//
//  CancionViewController.m
//  KenSpotifyStreamer
//
//  Created by Kenshin on 9/9/15.
//  Copyright (c) 2015 Kenshin. All rights reserved.
//

#import "CancionViewController.h"
#import <Spotify/Spotify.h>
#import "ArtistaCustomCell.h"
#import "SpotifySession.h"
#import "CancionCustomCell.h"


@interface CancionViewController ()

@end

@implementation CancionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [SpotifySession buscaTopSongs:self.artista withTarget:self];
}

-(void) updateCanciones:(NSMutableArray *)nuevaCancion{
    self.canciones = nuevaCancion;
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.canciones.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CancionCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CancionCustomCell" forIndexPath:indexPath];
    
    // Configure the cell...
    SPTTrack* track = self.canciones[indexPath.row];
    cell.nombreCancion.text = track.name;
    
    /*
    if ([track.album.covers count] > 0) {
        SPTImage* image = [track.album.covers objectAtIndex:0];
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSData * data = [[NSData alloc] initWithContentsOfURL: image.imageURL];
            if ( data == nil ){
                NSLog(@"Track %@ sin datos", track.name);
                return;
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                // WARNING: is the cell still using the same data by this point??
                cell.ImagenAlbum.image = [UIImage imageWithData: data];
            });
        });
    }
    else{
        NSLog(@"Track %@ no tiene imagenes.", track.name);
    }
     */
    
    return cell;
}

@end
