//
//  Home.m
//  PetGame
//
//  Created by Brenda Iñiguez on 6/23/16.
//  Copyright (c) 2016 UAGMobile. All rights reserved.
//

#import "Home.h"

@interface Home ()
@property NSMutableArray *maPetNames;
@property NSMutableArray *maPetImages;
@end

@implementation Home

/****************************************************************************/
#pragma mark - Initialization methods
/****************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initController {
    self.maPetNames  = [[NSMutableArray alloc] initWithObjects: @"Juega fucho con lala", @"Chacha pelota", @"Hora de saltar", @"Abrazo peludo", @"Estambres con kitty", @"Corre Corre", @"Vueltas en el pasto", @"Sigue la cola", @"Salta obstaculos", @"A nadar!!", @"Carreras de aficionados", @"Sabes bailar?", @"Sube la montaña", @"Hora de saltar", @"Hora de saltar", @"Hora de saltar", nil];
    self.maPetImages  = [[NSMutableArray alloc] initWithObjects: @"pet1.jpeg", @"pet2.jpeg", @"pet3.jpeg", @"pet4.jpeg", @"pet5.jpeg", @"pet6.jpeg", @"pet7.jpeg", @"pet8.jpeg", @"pet9.jpeg", @"pet10.jpeg", @"pet11.jpeg", @"pet12.jpeg", @"pet13.jpeg", @"pet14.jpeg", @"pet15.jpeg", @"pet16.jpeg", nil];
    
    }
/****************************************************************************/
#pragma mark - Table methods and delegates
/****************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.maPetNames.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    CellsPets *cell = (CellsPets *)[tableView dequeueReusableCellWithIdentifier: @"CellsPets"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"CellsPets" bundle:nil] forCellReuseIdentifier:@"CellsPets"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"CellsPets"];
    }
    //Fill cell with info from arrays
    cell.lblName.text       = self.maPetNames[indexPath.row];
    cell.imgPet.image   = [UIImage imageNamed:self.maPetImages[indexPath.row]];
    
    return cell;
}
@end
